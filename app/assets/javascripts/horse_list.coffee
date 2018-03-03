$(document).on 'change', '#forecast_key', ->
  $.ajax(
    type: 'PUT'
    url: 'horse_list'
    data: {
      race_id: Number(location.search.match('[0-9]{12}')),
      horse_number: Number($(this).parent().prevAll('.horse-number').text()),
      forecast: $(this).val()
    }
  )
