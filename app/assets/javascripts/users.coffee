$ ->
  $('.js-social--auth').on 'click', (e) ->
    e.preventDefault()

    href = $(this).attr('href')
    window.open(href, '', 'toolbar=0,status=0,width=626,height=436')

  if window.opener
    setTimeout ->
      window.opener.location.reload(true)
      window.close()
