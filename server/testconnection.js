const mongoose = require('mongoose');

const dbURI = 'mongodb+srv://myUser:Jigs2404@jigster.bwwlksq.mongodb.net/myFirstDatabase?retryWrites=true&w=majority';

mongoose.connect(dbURI, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log('MongoDB connected'))
    .catch(err => console.error('MongoDB connection error:', err));
