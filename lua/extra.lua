-- autocmds
au({ 'c', 'make', 'asm' }, "set noexpandtab" )
au({ 'c', 'make', 'asm' }, "set tabstop=8" )
au({ 'c', 'make', 'asm' }, "set softtabstop=8" )
au({ 'c', 'make', 'asm' }, "set shiftwidth=8" )
au({ 'asm' }, "syntax=nasm" )

au({ 'python', 'toml', 'yaml', 'nim', }, "set expandtab" )
au({ 'python', 'toml', 'yaml', 'nim', }, "set tabstop=4" )
au({ 'python', 'toml', 'yaml', 'nim', }, "set softtabstop=4" )
au({ 'python', 'toml', 'yaml', 'nim', }, "set shiftwidth=4" )

au({ 'plaintex', }, "set filetype=tex")
