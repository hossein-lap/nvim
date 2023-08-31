local path = require('mason-core.path')

--print(vim.fn.stdpath "data", "mason")
require("mason").setup({
	-- The directory in which to install packages.
	install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

	-- Where Mason should put its bin location in your PATH. Can be one of:
	-- - "prepend" (default, Mason's bin location is put first in PATH)
	-- - "append" (Mason's bin location is put at the end of PATH)
	-- - "skip" (doesn't modify PATH)
	---@type '"prepend"' | '"append"' | '"skip"'
	PATH = "prepend",

	-- Controls to which degree logs are written to the log file.
	-- It's useful to set this to vim.log.levels.DEBUG when
	-- debugging issues with package installations.
	log_level = vim.log.levels.DEBUG,

	-- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
	-- packages that are requested to be installed will be put in a queue.
	max_concurrent_installers = 1,

	-- [Advanced setting]
	-- The registries to source packages from.
	-- Accepts multiple entries. Should a package with the same name exist in
	-- multiple registries, the registry listed first will be used.
	registries = {
		"github:mason-org/mason-registry",
	},

	-- The provider implementations to use for resolving supplementary
	-- package metadata (e.g., all available versions).
	-- Accepts multiple entries, where later entries will be used as
	-- fallback should prior providers fail.
	-- Builtin providers are:
	--   - mason.providers.registry-api  - uses the https://api.mason-registry.dev API
	--   - mason.providers.client        - uses only client-side tooling to resolve metadata
	providers = {
		"mason.providers.registry-api",
		"mason.providers.client",
	},

	github = {
		-- The template URL to use when downloading assets from GitHub.
		-- The placeholders are the following (in order):
		-- 1. The repository (e.g. "rust-lang/rust-analyzer")
		-- 2. The release version (e.g. "v0.3.0")
		-- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	},

	pip = {
		-- Whether to upgrade pip to the latest version in the
		-- virtual environment before installing packages.
		upgrade_pip = false,

		-- These args will be added to `pip install` calls.
		-- Note that setting extra args might impact intended behavior
		-- and is not recommended.
		--
		-- Example: { "--proxy", "https://proxyserver" }
--		install_args = {"--proxy", "socks://127.0.0.1:10808"},
	},

	ui = {
		-- Whether to automatically check for new versions when opening the :Mason window.
		check_outdated_packages_on_open = true,

		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "rounded",

		-- Width of the window. Accepts:
		-- - Integer greater than 1 for fixed width.
		-- - Float in the range of 0-1 for a percentage of screen width.
		width = 0.8,

		-- Height of the window. Accepts:
		-- - Integer greater than 1 for fixed height.
		-- - Float in the range of 0-1 for a percentage of screen height.
		height = 0.7,

		icons = {
			package_installed = "✓ ",
			package_pending = "> ",
			package_uninstalled = "× "
		},

		keymaps = {
			-- Keymap to expand a package
			toggle_package_expand = "<CR>",
			-- Keymap to install the package under the current cursor position
			install_package = "i",
			-- Keymap to reinstall/update the package under the current cursor position
			update_package = "u",
			-- Keymap to check for new version for the package under the current cursor position
			check_package_version = "c",
			-- Keymap to update all installed packages
			update_all_packages = "U",
			-- Keymap to check which installed packages are outdated
			check_outdated_packages = "C",
			-- Keymap to uninstall a package
			uninstall_package = "X",
			-- Keymap to cancel a package installation
			cancel_installation = "<C-c>",
			-- Keymap to apply language filter
			apply_language_filter = "<C-f>",
		},
	},
})

local registry = require('mason-registry')

local list = {
	-- lsp
		'clangd', -- C/C++
		'gopls', -- Golang
		'lua-language-server', -- Lua
		'bash-language-server', -- Bash/Shell
		'perlnavigator', -- Perl
		'pyright', -- Python
		'vim-language-server', -- Vim
--		'typescript-language-server', -- TypeScript / JavaScript
	-- linter
--		'vale', -- Natural language
--		'write-good', -- Natural language
--		'alex', -- Natural language
		'proselint', -- Natural language
--		'textlint', -- Natural language
	-- writting
		'texlab',
--		'grammarly-languageserver',
}

for _,pkg in pairs(list) do
	if not registry.is_installed(pkg) then
		vim.notify(string.format('[mason]: %s: package not found\n', pkg), 3)
		vim.cmd(string.format(':MasonInstall --force %s', pkg))
	end
end

local pkgs_list = registry.get_installed_package_names()
function table.item(input_table, input_string)
	for index,_ in ipairs(input_table) do
		if input_table[index] == input_string then
			return index
		end
	end
	return 0
end

for _,value in ipairs(pkgs_list) do
	if table.item(list, value) == 0 then
		vim.notify('152: '..value, 3)
		vim.cmd(string.format(':MasonUninstall %s', value))
	end
end

vim.keymap.set('n', '<leader>ma', vim.cmd.Mason, {desc = 'Open mason lsp manager'})
