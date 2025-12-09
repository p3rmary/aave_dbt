{% macro event_name(topic_0) %}

case {{topic_0}}
when '0xb3d084820fb1a9decffb176436bd02558d15fac9b0ddfed8c465bc7359d7dce0' then 'Borrow'
when '0x2b627736bca15cd5381dcf80b0bf11fd197d01a037c52b927a881a10fb73ba61' then 'Supply'
when '0xe413a321e8681d831f4dbccbca790d2952b56f977908e45be37335533e005286' then 'LiquidationCall'
when '0x3115d1449a7b732c986cba18244e897a450f61e1bb8d589cd2e69e6c8924f9f7' then 'Withdraw'
when '0xa534c8dbe71f871f9f3530e97a74601fea17b426cae02e1c5aee42c96c784051' then 'Repay'
when '0xefefaba5e921573100900a3ad9cf29f222d995fb3b6045797eaea7521bd8d6f0' then 'Flashloan'
when '0x00058a56ea94653cdf4f152d227ace22d4c00ad99e2a43f58cb7d9e3feb295f2' then 'ReserveUsedAsCollateralEnabled'
when '0x2bccfb3fad376d59d7accf970515eb77b2f27b082c90ed0fb15583dd5a942699' then 'DeficitCreated'
when '0x44c58d81365b66dd4b1a7f36c25aa97b8c71c361ee4937adc1a00000227db5dd' then 'ReserveUsedAsCollateralDisabled'
when '0x804c9b842b2748a22bb64b345453a3de7ca54a6ca45ce00d415894979e22897a' then 'ReserveDataUpdated'
when '0xaef84d3b40895fd58c561f3998000f0583abb992a52fbdc99ace8e8de4d676a5' then 'IsolationModeTotalDebtUpdated'
when '0xbc7cd75a20ee27fd9adebab32041f755214dbc6bffa90cc0225b39da2e5c2d3b' then 'Upgraded'
when '0xbfa21aa5d5f9a1f0120a95e7c0749f389863cbdbfff531aa7339077a5bc919de' then 'MintedToTreasury'
when '0xd728da875fc88944cbf17638bcbe4af0eedaef63becd1d1c57cc097eb4608d84' then 'UserEmode'

else 'Unknown'

end

{% endmacro %}