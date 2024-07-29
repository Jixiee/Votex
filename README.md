
# Votex

## Introduction
Votex is a decentralized application (dApp) built on the Ethereum blockchain. It allows users to create and participate in voting contests securely and transparently. The application leverages smart contracts to ensure the integrity of the voting process.

## Features
- Create new voting contests
- Participate in ongoing contests
- Secure user authentication and data storage
- Real-time voting results
- Blockchain technology ensures transparency and immutability

## Technologies Used
- **Frontend:** React, Material-UI, Styled-components
- **Backend:** Node.js, Express.js
- **Blockchain:** Solidity, Ethereum, Web3.js
- **Database:** MongoDB Atlas

## Prerequisites
- Node.js and npm
- Metamask browser extension
- MongoDB Atlas account

## Installation

### Clone the Repository
```sh
git clone https://github.com/Jixiee/Votex.git
cd Votex
```

### Install Dependencies
#### For the Backend
```sh
cd server
npm install
```

#### For the Frontend
```sh
cd client
npm install
```

### Environment Variables
Create a `.env` file in the `server` directory and add the following:
```
MONGO_URI=your_mongodb_atlas_uri
PORT=5000
```

### Smart Contract Deployment
Make sure you have Metamask installed and configured with a testnet (e.g., Ropsten or Rinkeby).

1. Compile and deploy your smart contracts using Remix or Truffle.
2. Copy the deployed contract address and ABI.
3. Update the `contractAddress` and `contractABI` in your frontend code (`client/src/services/web3Context.js`).

### Running the Application
#### Start the Backend
```sh
cd server
npm start
```

#### Start the Frontend
```sh
cd client
npm start
```

The application should now be running on [http://localhost:3000](http://localhost:3000).

## Deployment

### Netlify (Frontend)
1. Install Netlify CLI
   ```sh
   npm install -g netlify-cli
   ```
2. Login to Netlify
   ```sh
   netlify login
   ```
3. Build the frontend
   ```sh
   set NODE_OPTIONS=--openssl-legacy-provider
   npm run build
   ```
4. Deploy to Netlify
   ```sh
   netlify deploy --prod --dir=build
   ```

## Contributing
We welcome contributions to enhance the functionality and features of this project. Please fork the repository, make your changes, and submit a pull request.

## License
This project is licensed under the MIT License.
