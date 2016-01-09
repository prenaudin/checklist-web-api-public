var PouchDB = require('pouchdb');

const db = new PouchDB('checklyst-server');

db.destroy();

db.put({
  id: 'pierre@muxumuxu.com',
  email: 'pierre@muxumuxu.com',
  name: 'pierre',
  type: 'users'
}).then(function(response) {
  console.log('User created');
});

// Projects
db.put({
  id: 'azendoo',
  title: 'Azendoo',
  type: 'projects',
  users: ['pierre@muxumuxu.com'],
  checklists: ['calendar', 'payment']
});

db.put({
  id: 'sample',
  title: 'Sample Project',
  type: 'projects',
  users: ['pierre@muxumuxu.com'],
  checklists: ['default']
});

// Checklists
db.put({
  id: 'calendar',
  title: 'Calendar',
  type: 'checklists',
  project: 'azendoo',
  suite: [
    { title: 'It should be render as a weekly grid' },
    { title: 'It should be shown as weekly or monthly'},
    { title: 'It should *not* cache the preset' }
  ],
  versions: []
})

db.put({
  id: 'payment',
  title: 'Payment',
  type: 'checklists',
  project: 'azendoo',
  suite: [
    { title: 'Currency can be set as the user IP country' },
    { title: 'When the period has been switched, the current amount is correct' },
    { title: 'Only managers can pay' }
  ],
  versions: []
})

db.put({
  id: 'default',
  title: 'Default',
  type: 'checklists',
  project: 'sample',
  suite: [
    { title: 'Clean the bedroom' },
    { title: 'Empty the bins'},
    { title: 'Spray some Febreze' }
  ],
  versions: []
})
