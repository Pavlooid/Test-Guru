document.addEventListener('turbolinks:load', function() {
  const control = document.getElementById('sort-by-column')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  const table = document.querySelector('table')

  // NodeList
  const rows = table.querySelectorAll('tr')
  const sortedRows = []

  // select all tables rows except header
  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

const sortedTable = document.createElement('table')

  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  for (let i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  const testTitle1 = row1.querySelector('.column').textContent
  const testTitle2 = row2.querySelector('.column').textContent

  if (testTitle1 < testTitle2) { return -1}
  if (testTitle1 > testTitle2) { return 1}
  return 0
}

function compareRowsDesc(row1, row2) {
  const testTitle1 = row1.querySelector('.column').textContent
  const testTitle2 = row2.querySelector('.column').textContent

  if (testTitle1 < testTitle2) { return 1}
  if (testTitle1 > testTitle2) { return -1}
  return 0
}
