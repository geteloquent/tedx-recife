jQuery ->
  $('.video-list-item').hover ->
    $(this).find('.overlay').addClass('open')
    $(this).find('p').fadeIn()

    width = $(this).css('width')
    $(this).css('width', width*2)
  , ->
    $(this).find('.overlay').removeClass('open')
    $(this).find('p').fadeOut()

  $('.video-list-item').click ->
    url = $(this).data('href')
    window.open(url)
