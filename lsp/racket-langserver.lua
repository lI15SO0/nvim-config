-- https://github.com/jeapostrophe/racket-langserver
-- raco pkg install racket-langserver

return {
  cmd = { 'racket', '-l', 'racket-langserver' },
  filetypes = { 'racket', 'scheme' },
  root_markers = { '.git' },
}
