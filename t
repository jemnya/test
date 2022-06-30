const lib = require('lib')({token: process.env.STDLIB_SECRET_TOKEN});

let UID = await lib.googlesheets.query['@0.3.0'].distinct({
  range: `Sheet1!A:G`,
  bounds: 'FIRST_EMPTY_ROW',
  where: [
    {
      'Total__gte': 5,
      'Total__lt': 10
    }
  ],
  limit: {
    'count': 0,
    'offset': 0
  },
  field: `User_ID`
});

let i = 0

while(i < UID.distinct.values.length){
    lib.discord.guilds['@0.2.4'].members.roles.update({
      role_id: `983511876447117322`,
      user_id: `${UID.distinct.values[i]}`,
      guild_id: `982843111187308624`
    });
    console.log(UID.distinct.values[i])
    i = i + 1
}
