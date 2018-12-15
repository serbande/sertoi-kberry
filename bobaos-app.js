const Baos = require('bobaos');
const app = new Baos({serialPort: {device: '/dev/ttyAMA0'}, debug: false});


const homeDevices= {
    light = {
        switch : 1,
        status : 2
    },
    shutter = {
        switch : 3,
        stop: 4,
        absolute: 5,
        status: 6
    }
}
// send requests after successful initial reset
app.on('open', () => {
  // get server item
  app
    .getServerItem(1, 6)
    .then(data => {
      console.log('got server item 1-17', data);
    })
    .catch(e => {
      console.log('err', e);
    });

  // now get datapoint description
  app
    .getDatapointDescription(1, 6)
    .then(data => {
      console.log('got datapoint description 1-30', data);
    })
    .catch(data => {
      console.log('err while getting datapoint description 1-30', data);
    });

});

// listen to reset event
app.on('reset', _ => {
  console.log('got reset indication');
});

// listen to indication events
app.on('DatapointValue.Ind', data => {
  console.log('got datapoint value indication: ', data);
});

app.on('ServerItem.Ind', data => {
  console.log('got server item indication: ', data);
});