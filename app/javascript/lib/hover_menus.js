import tippy from 'tippy.js';

function itemContent(el) {
  let model = el.id.split('_')[0]
  let id = el.id.split('_')[1]

  return(`
    <div id="${model}_${id}_tippy" class="shadow flex bg-white rounded-full border h-7 w-7 justify-center items-center">
      <a href="/${model}s/${id}" class="px-2" data-turbo-method="delete"><i class='gg-trash-empty'></i></a>
    </div>
  `)
  // <a href="/${model}s?item_type=${item_type}&use_template=true" class="border-r-2 mr-2 px-2" data-turbo-method="post">＋</span>
  // <a href="/${model}s/${id}/change_position?direction=higher" class="border-r-2 mr-2 px-2" data-turbo-method="patch">△</a>
  // <a href="/${model}s/${id}/change_position?direction=lower" class="px-2" data-turbo-method="patch">▽</a>
}

function sectionContent(el) {
  let model = el.dataset.model
  let id = el.id.split('_')[1]
  let item_type = el.dataset.itemType || ''
  let cv_id = el.dataset.cvId || ''

  return(`
    <div class="shadow flex bg-white rounded-full border px-2 justify-center items-center">
      <a href="/${model}s?item_type=${item_type}&use_template=true&cv_id=${cv_id}" class="flex px-2 items-center" data-turbo-method="post"><i class='gg-add mr-1'></i> ajouter</span>
    </div>
  `)
}

export function hoverItemMenu(el) {
  let model = el.id.split('_')[0]
  let maxWidth = model == 'skill' ? 20 : 350

  return (
    tippy(el, {
      content: itemContent(el),
      allowHTML: true,
      hideOnClick: true,
      interactive: true,
      interactiveBorder: 5,
      flip: false,
      lazy: false,
      flipOnUpdate: false,
      maxWidth: maxWidth,
      offset: [1, -1],
      placement: 'left',
    })
  )
}

export function hoverSectionMenu(el) {
  return (
    tippy(el, {
      content: sectionContent(el),
      allowHTML: true,
      hideOnClick: true,
      interactive: true,
      interactiveBorder: 10,
      flip: false,
      offset: [0, -100],
      placement: 'right-start'
    })
  )
}
