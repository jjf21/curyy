import tippy from 'tippy.js';


function tooltipContent() {
  return(`
    <div class="flex">
      <span class="bg-gray-200 rounded-full mr-2 px-2">✕</span>
      <span class="bg-gray-200 rounded-full mr-2 px-2">△</span>
      <span class="bg-gray-200 rounded-full px-2">▽</span>
    </div>
  `)
}

export function hoverItemMenu(el) {
  return (
    tippy(el, {
      content: tooltipContent(),
      allowHTML: true,
      interactive: true,
      placement: 'left',
    })
  )
}
