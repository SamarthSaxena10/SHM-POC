import Web3 from "web3";

// Create an instance of Web3 using the MetaMask provider
const web3 = new Web3(window.ethereum);

// Add an event listener to the connect wallet button
document
  .getElementById("connectWalletButton")
  .addEventListener("click", connectWallet);

// Function to handle wallet connection
async function connectWallet() {
  // Check if the MetaMask provider is available
  if (window.ethereum) {
    try {
      // Request the user's permission to connect their wallet
      await window.ethereum.request({ method: "eth_requestAccounts" });

      // Wallet connected successfully
      console.log("Wallet connected!");

      // You can now access the user's wallet address and interact with the blockchain
      const accounts = await web3.eth.getAccounts();
      const walletAddress = accounts[0];
      console.log("Wallet address:", walletAddress);

      // Perform additional actions or trigger events upon successful wallet connection
      // ...
    } catch (error) {
      console.error("Wallet connection error:", error);
    }
  } else {
    console.error("MetaMask is not installed");
  }
}
