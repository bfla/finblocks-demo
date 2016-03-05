Meteor.startup ->
  return if Meteor.users.findOne()

  Accounts.createUser
    password: 'letmein123'
    email: 'brian@finblocks.com'
    profile:
      firstName: 'Brian'
      lastName: 'Flaherty'
      avatar: 'https://randomuser.me/api/portraits/thumb/men/1.jpg'

  Accounts.createUser
    password: 'letmein123'
    email: 'gandalf@finblocks.com'
    profile:
      firstName: 'Gandalf'
      lastName: 'Grey'
      avatar: 'https://randomuser.me/api/portraits/thumb/lego/2.jpg'

  Accounts.createUser
    password: 'letmein123'
    email: 'gweneth@finblocks.com'
    profile:
      firstName: 'Gweneth'
      lastName: 'Paltrow'
      avatar: 'https://randomuser.me/api/portraits/thumb/women/2.jpg'

  Accounts.createUser
    password: 'letmein123'
    email: 'bilbo@finblocks.com'
    profile:
      firstName: 'Bilbo'
      lastName: 'Baggins'
      avatar: 'https://randomuser.me/api/portraits/thumb/lego/4.jpg'

  return if Ideas.findOne()
  userId = Meteor.users.findOne()._id
  return unless userId?

  Ideas.insert(
    userId: userId
    symbol: 'MADOFF'
    description: 'This guy always makes money. It is like magic'
    expiry: moment().add(10, 'days').toDate()
    startDate: moment().add(1, 'days').toDate()
    endDate: moment().add(15, 'days').toDate() )

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


