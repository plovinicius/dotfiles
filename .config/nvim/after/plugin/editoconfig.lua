local status, editorconfig = pcall(require, "editorconfig")
if (not status) then return end

editorconfig.properties.foo = function(bufnr, val)
  vim.b[bufnr].foo = val
end