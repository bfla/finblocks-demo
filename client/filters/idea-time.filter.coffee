ideaTime = ->
  (time) ->
    console.log time
    now = moment()
    time2 = moment(time)
    return time2.from(now)

angular
  .module('finblocks')
  .filter('ideaTime', ideaTime)
