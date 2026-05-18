#################################################################
#                            RIPGREP                            #
#################################################################

# 'fast' inside README.md
rg fast README.md

# every result with its filepath
rg fast --no-heading

# hide line numbers [and hide filename[, strip newlines[, match only]]]
rg fast -N
rg fast --no-line-number
rg fast -NI
rg fast -N --no-filename
rg fast -NI --no-heading
rg fast -NIo --no-heading
rg fast -NI --only-matching --no-heading
rg fast -NI -o --no-heading

# do not print anything (useful for its exit code)
rg fast --quiet

# max columns to show
rg fast --max-columns
rg fast -M

# 'help' or 'sudo' inside ./
rg --regexp help --regexp sudo
rg -e help -e sudo

# '-h' or '-foo' recursively inside ./
rg -e -h -e -foo

# any matches from a file of patterns
rg --file patrones.txt ./src
rg -f patrones.txt ./src
rg -f patrones.txt -e "DEBUG_ONLY" ./src

# any matches from a "file" with patterns that comes from stdin
git diff --name-only | rg -f - ./src

# find inside directories with {0,1,2,3} levels max depth
git diff --name-only | rg -f - ./src --max-depth 3
git diff --name-only | rg -f - ./src -d 3

# positional arguments (files or directories to search)
rg -f patrones.txt logs/ data/ backup/ stow.md

# case-sensitive search (default); also -i/--ignore-case, -S/--smart-case
rg --case-sensitive fast README.md
rg -s fast README.md

# words starting with 'fast' (bigger) inside README.md (not final '.')
rg 'fast\w+' README.md

# words starting with 'fast' (even only 'fast') inside README.md
rg 'fast\w*' README.md

# lines having 'fn write(', recursively, current dir, regex
rg 'fn write\(' 
rg 'fn write\(' ./

# lines having 'fn write(', recursively, current dir, fixed string
rg --fixed-strings 'fn write('
rg -F 'fn write('
rg -F 'fn write(' ./

# show effective lines in a file
sudo rg --invert-match -e "^#" -e '^\s*$' /etc/tlp.conf
sudo rg -v -e "^#" -e '^\s*$' /etc/tlp.conf

# effective AND behavior with pipes
ps aux | rg "python" | rg "uvicorn"

# show real time log without certain lines
tail -f /var/log/syslog | rg --invert-match "cron"
tail -f /var/log/syslog | rg -v "cron"

# lines having 'fn write(', recursively, src/ dir, regex 
rg 'fn write\(' src

# lines... and ignores .gitignore rules
rg -u 'fn write\('
#      ... and can serach inside hidden files and directories
rg -uu 'fn write\('
#      ... and can search inside binary files
rg -uuu 'fn write\('

# whitelist log/, even if .gitignore have the rule
echo "!log/" >> .ignore

# lines having 'clap' in toml files (note the sigle quotes)
rg clap --glob '*.toml'
rg clap -g '*.toml'

# lines having 'clap' NOT IN .toml files
rg clap -g '!*.toml'

# later globs will override earlier globs (here we search .toml files)
rg clap -g '!*.toml' -g '*.toml'

# search inside C files (.c and .h)
rg 'int main' -g '*.{c,h}'

# list common file types by category
rg --type-list

# use category c to list .c and .h files
rg 'int main' --type c
rg 'int main' -tc

# now search inside ruby files: .gemspec, .rb, Rakefile, config.ru, ...
rg 'gem' -truby

# define a web type and search 'title' (with/without case insensitivity)
rg --type-add 'web:*.{html,css,js}' -tweb title
rg --type-add 'web:*.{html,css,js}' --glob-case-insensitive -tweb title

# transform matched text into another
rg fast README.md --replace FAST
rg fast README.md -r FAST

# transform matched line into a string
rg '^.*fast.*$' README.md -r FAST
rg fast README.md --only-matching --replace FAST
rg fast README.md -or FAST

# read long, absolute paths as relative paths
rg "/home/rich/projects/project1/" --replace "./"
rg "/home/rich/projects/project1/" -r "./"

# refactoring with groups
rg "(\w+)=(\w+)" --replace '"$1": "$2"' config.env
rg "(\w+)=(\w+)" -r '"$1": "$2"' config.env

# find 'fast' followed by another word and show a dash between them
rg 'fast\s+(\w+)' README.md --replace 'fast-$1'
rg 'fast\s+(\w+)' README.md -r 'fast-$1'

# find only the info you search for, not entire lines
rg 'ID: (\d+)' --replace 'UserID: $1'

# rg configuration file example
--type-add=web:*.{html,css,js}

# count number of matches per file [and show zero coincidences]
rg has --count
rg has -c
rg has -c --include-zero

# show 1 line after and 1 line before
rg fast README.md --context 1
rg fast README.md -C 1

# show 1 line before
rg fast README.md --before-context 1
rg fast README.md -B 1

# show 2 lines after
rg fast README.md --after-context 2
rg fast README.md -A 2

# how many files rg would search
rg --files | wc -l

# search binary files as if they were plain text (ex. PDFs or .db)
rg --text "Factura_2024" documentos/ | less
rg -a "Factura_2024" documentos/ | less

# matches to span multiple lines (\s includes [\t\n\v\f\r ])
rg --multiline "ERROR:\nConexión"
rg -U "ERROR:\nConexión"
rg -U "ERROR:\s+Conexión"

# search compressed files (gzip, bzip2, lzma, xz, iz4, brotli, zstd)
rg --search-zip fast
rg -z fast

# force ripgrep to sort its output by file name (slow output)
rg --sort fast

# open in nvim every file that matches a pattern
rg --files-with-matches "pattern" | xargs -o nvim
rg -l "pattern" | xargs -o nvim

# stats: number of matches, files (founded, searched), time
rg "pattern" --files-with-matches --stats
rg has --files-with-matches --color=never
rg has -l --color=never

# files with matches
rg -l "FATAL_ERROR" log/ | xargs -o rm
rg --files-with-matches "FATAL_ERROR" log/ | xargs -o rm

# word boundaries (matches 'text-red', not 'rendered')
rg --word-regexp "red" ./templates
rg -w "red" ./templates

# word boundaries, two matches
rg --word-regexp "def" ./src | rg --word-regexp "run"
rg -w "def" ./src | rg -w "run"

