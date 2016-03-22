Meteor.startup ->
  Ideas._ensureIndex({userId: 1})
  Ideas._ensureIndex({symbol: 1})
  Follows._ensureIndex({followerId: 1, followingId: 1}, {unique: 1})
  Favorites._ensureIndex({userId: 1})

Meteor.startup ->
  return if Meteor.users.findOne()

  Accounts.createUser
    password: 'letmein123'
    email: 'mrmarket@finblocks.com'
    profile:
      firstName: 'Mr'
      lastName: 'Market'
      avatar: 'https://randomuser.me/api/portraits/thumb/lego/2.jpg'
      jobTitle: 'Equities Analyst'
      employer: 'Greed & Fear Investment Strategies'

  Accounts.createUser
    password: 'letmein123'
    email: 'brian@finblocks.com'
    profile:
      firstName: 'Brian'
      lastName: 'Flaherty'
      avatar: 'https://randomuser.me/api/portraits/thumb/men/4.jpg'
      jobTitle: 'Hedge fund analyst'
      employer: 'BlueArc Capital'

  Accounts.createUser
    password: 'letmein123'
    email: 'ben@finblocks.com'
    profile:
      firstName: 'Benjamin'
      lastName: 'Graham'
      avatar: 'https://randomuser.me/api/portraits/thumb/men/3.jpg'
      jobTitle: 'Intelligent Investor'
      employer: 'Graham-Newman LLP'

  Accounts.createUser
    password: 'letmein123'
    email: 'gandalf@finblocks.com'
    profile:
      firstName: 'Gandalf'
      lastName: 'Grey'
      avatar: 'https://randomuser.me/api/portraits/thumb/lego/6.jpg'
      jobTitle: 'Securities Analyst'
      employer: 'Rivendell Associates'

  Accounts.createUser
    password: 'letmein123'
    email: 'gweneth@finblocks.com'
    profile:
      firstName: 'Gweneth'
      lastName: 'Paltrow'
      avatar: 'https://randomuser.me/api/portraits/thumb/women/2.jpg'
      jobTitle: 'Managing Partner'
      employer: 'Stark Industries'

  Accounts.createUser
    password: 'letmein123'
    email: 'frodo@finblocks.com'
    profile:
      firstName: 'Frodo'
      lastName: 'Baggins'
      avatar: 'https://randomuser.me/api/portraits/thumb/lego/4.jpg'
      jobTitle: 'Fellow'
      employer: 'Shire Velocity Capital'

  Accounts.createUser
    password: 'letmein123'
    email: 'warren@finblocks.com'
    profile:
      firstName: 'Warren'
      lastName: 'Buffett'
      avatar: 'https://randomuser.me/api/portraits/thumb/men/2.jpg'
      jobTitle: 'Top Dawg'
      employer: 'Berkshire Hathaway'

  return if Ideas.findOne()
  _mrMarket = Meteor.users.findOne('profile.firstName': 'Mr')._id
  _warren = Meteor.users.findOne('profile.firstName': 'Warren')._id
  _gandalf = Meteor.users.findOne('profile.firstName': 'Gandalf')._id
  return unless _mrMarket? and _warren? and _gandalf?

  Ideas.insert(
    userId: _gandalf
    symbol: 'AAPL'
    description: 'High risk but they are sitting on a big pile of natural
                  resources. I am confident that Balrog will no loner be a
                  problem.'
    basis: 'fundamental'
    exitPrice: 10.00
    stopLossPrice: 12.00
    horizonDate: moment().add(30, 'days').toDate()
  )

  Ideas.insert(
    userId: _mrMarket
    symbol: 'AMZN'
    description: 'This one is a sure thing.'
    basis: 'technical'
    exitPrice: 100.00
    stopLossPrice: 120.00
    horizonDate: moment().add(30, 'days').toDate()
  )

  Ideas.insert(
    userId: _mrMarket
    symbol: 'TSLA'
    description: 'This one is also a sure thing.'
    basis: 'technical'
    exitPrice: 10.00
    stopLossPrice: 12.00
    horizonDate: moment().add(30, 'days').toDate()
  )

  Ideas.insert(
    userId: _warren
    symbol: 'AXP'
    description: 'This company is fundamentally sound and undervalued!'
    basis: 'fundamental'
    exitPrice: 50.00
    stopLossPrice: 60.00
    horizonDate: moment().add(30, 'days').toDate()
  )


