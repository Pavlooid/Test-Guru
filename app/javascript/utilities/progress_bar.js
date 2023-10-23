document.addEventListener('turbolinks:load', function() {
  const progress = document.querySelector('.progress')

  if (progress) progressBarToTestPassage()
})

function progressBarToTestPassage() {
  let bar = document.querySelector('.progress-bar');
  let width = bar.dataset.progressPercent
  bar.style.width = `${width}%`
}
