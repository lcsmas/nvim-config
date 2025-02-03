vim.api.nvim_create_user_command('CdRoot', function()
  local git_dir = vim.fn.finddir('.git', '.;')
  if git_dir ~= '' then
    vim.cmd('cd ' .. vim.fn.fnamemodify(git_dir, ':h'))
  else
    print 'No .git directory found'
  end
end, {})
