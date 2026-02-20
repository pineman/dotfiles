-- Custom claudecode.nvim terminal provider: opens Claude as a full buffer
local M = {}

local bufnr = nil
local jobid = nil

local function cleanup()
  bufnr = nil
  jobid = nil
end

local function is_buf_valid()
  return bufnr and vim.api.nvim_buf_is_valid(bufnr)
end

local function is_focused()
  return is_buf_valid() and vim.api.nvim_get_current_buf() == bufnr
end

local function focus()
  if is_buf_valid() then
    vim.cmd("buffer " .. bufnr)
    vim.cmd("startinsert")
  end
end

local function go_back()
  -- Switch to previous buffer
  if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
    vim.cmd("bprev")
  end
end

function M.setup() end

function M.open(cmd_string, env_table, config, focus_term)
  if focus_term == nil then focus_term = true end

  if is_buf_valid() then
    if focus_term then focus() end
    return
  end

  -- Remember where we were
  local orig_buf = vim.api.nvim_get_current_buf()

  -- Create a new buffer and open terminal in it
  vim.cmd("enew")
  local term_cmd
  if cmd_string:find(" ", 1, true) then
    term_cmd = vim.split(cmd_string, " ", { plain = true, trimempty = false })
  else
    term_cmd = { cmd_string }
  end

  jobid = vim.fn.termopen(term_cmd, {
    env = env_table,
    cwd = config.cwd,
    on_exit = function(id, _, _)
      vim.schedule(function()
        if id == jobid then
          if config.auto_close and bufnr and vim.api.nvim_buf_is_valid(bufnr) then
            vim.cmd("bdelete! " .. bufnr)
          end
          cleanup()
        end
      end)
    end,
  })

  if not jobid or jobid == 0 then
    vim.notify("Failed to open Claude terminal.", vim.log.levels.ERROR)
    vim.cmd("buffer " .. orig_buf)
    cleanup()
    return
  end

  bufnr = vim.api.nvim_get_current_buf()
  vim.bo[bufnr].bufhidden = "hide"
  vim.bo[bufnr].buflisted = true

  if focus_term then
    vim.cmd("startinsert")
  else
    vim.cmd("buffer " .. orig_buf)
  end
end

function M.close()
  if is_buf_valid() then
    vim.cmd("bdelete! " .. bufnr)
    cleanup()
  end
end

function M.simple_toggle(cmd_string, env_table, config)
  if is_buf_valid() and is_focused() then
    go_back()
  elseif is_buf_valid() then
    focus()
  else
    M.open(cmd_string, env_table, config)
  end
end

function M.focus_toggle(cmd_string, env_table, config)
  M.simple_toggle(cmd_string, env_table, config)
end

function M.toggle(cmd_string, env_table, config)
  M.simple_toggle(cmd_string, env_table, config)
end

function M.get_active_bufnr()
  if is_buf_valid() then return bufnr end
  return nil
end

function M.is_available()
  return true
end

return M
