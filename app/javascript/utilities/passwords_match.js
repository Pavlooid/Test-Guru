document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#new_user')

  const password = document.getElementById('password');
  const confirmPassword = document.getElementById('password-confirmation');

  password.addEventListener('input', () => {
    validatePasswords();
  })

  confirmPassword.addEventListener('input', () => {
    validatePasswords();
  })

  function validatePasswords() {
    const passwordValue = password.value;
    const confirmPasswordValue = confirmPassword.value;

    if (passwordValue !== confirmPasswordValue) {
      confirmPassword.setCustomValidity('Пароли не совпадают');
    } else {
      confirmPassword.setCustomValidity('');
    }
  }
})
