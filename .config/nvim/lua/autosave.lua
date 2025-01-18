local backup_dir = vim.fn.expand('~/.vim/temp-backup')
if vim.fn.isdirectory(backup_dir) == 0 then
    vim.fn.mkdir(backup_dir, 'p')
end

local function save_all_buffers()
    local buffers = vim.api.nvim_list_bufs()
    for _, bufnr in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'modified') then
            local cur_pos = vim.fn.getcurpos()
            local filename = vim.api.nvim_buf_get_name(bufnr)
            if filename == '' then
                filename = string.format('%s/unnamed_%s_%d.txt', backup_dir, os.date('%Y%m%d_%H%M%S'), bufnr)
                local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
                vim.api.nvim_buf_set_name(bufnr, filename)
			end
            vim.cmd(string.format('silent! write! %s', filename))
            vim.fn.setpos('.', cur_pos)
        end
    end
end

local timer = vim.loop.new_timer()
timer:start(0, 5000, vim.schedule_wrap(function()
    save_all_buffers()
end))

