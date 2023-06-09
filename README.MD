## Hardhat配置

专注于合约编写

### 1. 安装Hardhat

```shell
npm install --save-dev hardhat
```

### 2. 运行Hardhat，生成项目

```shell
npx hardhat
```

### 3. 更多安装

```shell
npm install --save-dev @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers ethers
```

### 4. 编译合约

```shell
npx hardhat compile
```

### 5. 单元测试

```shell
npx hardhat test 
```

### 6. 发布合约（内存测试）

```shell
npx hardhat run scripts/deploy-greeter.js
```

### 7. 启动Hardhat网络服务

```shell
npx hardhat node
```

### 8. 发布合约到自己启动的网络（第一个服务）

```shell
# 默认空网络
npx hardhat run scripts/deploy-greeter.js --network localhost
# fork主网
npx hardhat node --fork https://eth-mainnet.alchemyapi.io/v2/<key>
# 或者在hardhat.config.js中配置
module.exports = {
  networks: {
    hardhat: {
      forking: {
        url: "https://eth-mainnet.alchemyapi.io/v2/<key>"
      }
    }
  },
  // 其他配置选项...
};

```

### 9. 打开小狐狸MetaMask连接，查看余额是否正常

> RPC:  http://127.0.0.1:8545/

或Hardhat控制台:

> npx hardhat console

### 10. 启动 poc-client 对合约进行操作
