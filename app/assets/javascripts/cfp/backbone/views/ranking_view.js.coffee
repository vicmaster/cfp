class Cfp.Views.RankingView extends Backbone.View
  el: '#ranking'

  events:
    'change #rank' : 'changeRank'

  changeRank: ->
    rank = new Cfp.Models.Rank
    rank.save
      value: @selectedRank()

  selectedRank: =>
    @$('#rank:checked').val()
