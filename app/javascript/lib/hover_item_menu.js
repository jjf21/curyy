import tippy from 'tippy.js';


function tooltipContent(el) {
  let model = el.id.split('_')[0]
  let id = el.id.split('_')[1]
  let item_type = el.dataset.itemType || ''

  return(`
    <div class="flex bg-white rounded border p-2">
      <a href="/${model}s?item_type=${item_type}&use_template=true" class="border-r-2 mr-2 px-2" data-turbo-method="post">＋</span>
      <a href="/${model}s/${id}" class="px-2" data-turbo-method="delete" data-confirm="On supprime ?">✕</a>
    </div>
  `)

  // <a href="/${model}s/${id}/change_position?direction=higher" class="border-r-2 mr-2 px-2" data-turbo-method="patch">△</a>
  // <a href="/${model}s/${id}/change_position?direction=lower" class="px-2" data-turbo-method="patch">▽</a>
}

export function hoverItemMenu(el) {
  return (
    tippy(el, {
      content: tooltipContent(el),
      allowHTML: true,
      interactive: true,
      placement: 'left-start',
    })
  )
}
