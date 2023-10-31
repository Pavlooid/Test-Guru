document.addEventListener('turbolinks:load', () => {
  const timerInSec = document.getElementById('seconds')
  if (timerInSec) {
    new Timer(timerInSec).timer()
  }
})

class Timer {

  constructor(timerInSec) {
    this.cookieKey = 'time_to_finish'
    this.timerInSec = timerInSec
  }

  timer = () => {
    this.timer = this.leftTime()
    const intervalId = setInterval(() => {

      if (this.timer) {
        this.timer -= 1
        this.timerInSec.innerText = `Seconds left - ${this.timer}`
      } else {
        document.querySelector('form#attempt').submit()
        clearInterval(intervalId)
       }
    }, 1000)
  }

  leftTime = () => {
    const difference = new Date(this.finishTimeCookie()) - new Date()
    return Math.round(difference / 1000)
  }

  finishTimeCookie = () => {
    const checkCookie = document.cookie.match(new RegExp(`(^| )${this.cookieKey}=([^;]+)`))[2]
    return decodeURIComponent(checkCookie)
  }
}
