document.addEventListener('turbolinks:load', function() {
  
  let $formInline = $('.form-inline-link')
  $formInline.on('click', formInlineLinkHandler);

  const errors = document.querySelector('.resource-errors');
 
  if (errors && $formInline === '') {
    const resourceId = errors.dataset.resourceId;
    formInlineHandler(resourceId);
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault();

  let testId = this.dataset.testId;
  formInlineHandler(testId);
}

function formInlineHandler(testId) {
  const link = document.querySelector(`.form-inline-link[data-test-id='${testId}']`);
  const $testTitle = $(`.test-title[data-test-id='${testId}']`);
  const $formInline = $(`.form-inline[data-test-id='${testId}']`);

  $formInline.toggle()
  $testTitle.toggle()

  if ($formInline.is(':visible')) {
    link.textContent = 'Cancel';
  } else {
    link.textContent = 'Edit';
  }
}
