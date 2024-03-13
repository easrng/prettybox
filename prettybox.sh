_prettybox_line() {
  printf '\033[2m\033[?7l────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────\r\033[?7h\033[0m'
}
prettybox_start() {
  _prettybox_title=""
  if [ ! "$1" = "" ]; then
    _prettybox_title="$(printf '╴\033[0m%s\033[2m╶' "$1")"
  fi
  _prettybox_line
  printf '\033[2m╭%s\033[200G╮\033[0m\n' "$_prettybox_title"
  unset _prettybox_title
}
prettybox_body() {
  sed -e 's/^/\x1b[2m│\x1b[0m /' -e 's/$/\x1b[200G\x08 \x1b[2m│\x1b[0m/'
}
prettybox_end() {
  _prettybox_line
  printf '\033[2m╰\033[0m\033[200G\033[2m╯\033[0m\n'
}
