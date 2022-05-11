export function convertHtmlToRaw(html) {
  var raw = html
    .replaceAll('&nbsp;', '')
    .replaceAll('<p></p><p>', '')
    .replaceAll('</p><p></p>', '')
    .replaceAll('</p><p>', '\n')
    .replaceAll('<br>', '\n')
    .replaceAll('<p>', '')
    .replaceAll('</p>', '')

  // TODO: delete
  console.log(raw);
  return raw
}
