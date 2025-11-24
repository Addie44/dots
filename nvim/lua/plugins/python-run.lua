-- F6 → Run Python file in bottom terminal & auto-close old terminals
vim.keymap.set('n', '<F6>', function()
  local file = vim.fn.expand('%:p')

  if vim.fn.expand('%:e') ~= 'py' then
    print("⚠️ Not a Python file!")
    return
  end

  vim.cmd('w')  -- save

  -- close previous python terminals
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf):match("term://.*python3") then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end

  vim.cmd('botright 10split | terminal python3 "' .. file .. '"')
  vim.cmd('startinsert')
end, { noremap = true, silent = true, desc = "Run Python file" })
