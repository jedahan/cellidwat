opencell_api = 'https://www.opencellid.org'
api_key = '51846820-9224-465a-a853-53b6b227be9d'

@updateCellId = ->
  navigator.geolocation.getCurrentPosition (position) ->
    latmin = position.coords.latitude - 0.1
    latmax = position.coords.latitude + 0.1
    lonmin = position.coords.longitude - 0.1
    lonmax = position.coords.longitude + 0.1
    url = opencell_api + "/cell/getInArea?key=#{api_key}&format=xml"

    # Set up an XMLHttpRequest
    $.get url + "&latmin=#{latmin}&latmax=#{latmax}&lonmin=#{lonmin}&lonmax=#{lonmax}", (response) ->
      console.log cell = $(response).find("rsp cell")[0]
      localStorage.cellid = JSON.stringify {
        timestamp:(new Date()).getTime()
        cellid: {
          mnc: cell.attr 'mnc'
          mcc: cell.attr 'mcc'
        }
      }

$(document).ready ->
  $.support.cors = true
  $.ajaxSetup xhr: -> new window.XMLHttpRequest mozSystem: true

  # Update the cellid if we haven't checked in 2 minutes
  if not localStorage.cellid? or (localStorage.cellid? and JSON.parse(localStorage.cellid)?.timestamp < (new Date()).getTime() - 2*60*1000)
    updateCellId()
    console.log "CellID: ", cellid = JSON.parse localStorage.cellid
    $('#cellid').append cellid
