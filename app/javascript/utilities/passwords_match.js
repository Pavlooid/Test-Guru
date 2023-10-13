document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#new_user')

  if (control) { control.addEventListener('input', validatePasswords) }
})

function validatePasswords() {
  password = document.getElementById('password');
  confirmPassword = document.getElementById('password-confirmation');
  error = document.getElementById('passwords-check');

  if (!confirmPassword.value) {
    error.textContent = '';
  } else if (password.value === confirmPassword.value) {
    error.classList.add('text-success')
    error.classList.remove('text-danger')
    error.textContent = 'Пароли совпадают!'
  } else if (password.value !== confirmPassword.value) {
    error.classList.add('text-danger')
    error.classList.remove('text-success')
    error.textContent = 'Пароли не совпадают!';
  }
}
