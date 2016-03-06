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
  userId = Meteor.users.findOne()._id
  return unless userId?

  Ideas.insert(
    userId: userId
    symbol: 'MADOFF'
    description: 'This guy always makes money. It is like magic'
    expiry: moment().add(10, 'days').toDate()
    startDate: moment().add(1, 'days').toDate()
    endDate: moment().add(15, 'days').toDate()
  )

  Ideas.insert(
    userId: userId
    symbol: 'ENRON'
    description: 'This one is a sure thing.'
    expiry: moment().add(30, 'days').toDate()
    startDate: moment().toDate()
    endDate: moment().add(30, 'days').toDate()
  )

  Ideas.insert(
    userId: userId
    symbol: 'WCOM'
    description: 'I am very confident about this one. Buy buy buy!'
    expiry: moment().add(10, 'days').toDate()
    startDate: moment().subtract(6, 'days').toDate()
    endDate: moment().add(10, 'days').toDate()
  )


