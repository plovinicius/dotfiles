local status, phpcsfixer = pcall(require, "vim-php-cs-fixer")
if (not status) then return end

local M = {}

function M.config()
    vim.g.php_cs_fixer_path = "./vendor/bin/php-cs-fixer"
end

return M