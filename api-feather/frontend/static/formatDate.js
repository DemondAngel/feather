export function formatDate(dateStr) {
  const date = new Date(dateStr)
  const options = {
    weekday: 'short',
    year: 'numeric',
    month: 'short',
    day: '2-digit',
    minute: '2-digit',
    hour: '2-digit',
    second: '2-digit',
  }
  const locale = navigator.language
  return new Intl.DateTimeFormat(locale, options).format(date)
}

export function formatCurrency(amount) {
  const options = {
    style: 'currency',
    currency: 'MXN',
  }
  const locale = navigator.language
  return new Intl.NumberFormat(locale, options).format(amount)
}
