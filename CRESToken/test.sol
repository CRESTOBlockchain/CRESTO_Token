 function ()
      public
      payable {
      // Not enough gas for the transaction so prevent users from sending ether
      require (!crowdsaleClosed);
      
       balanceOf[msg.sender] += msg.value;
      _amountRaised += msg.value;
       uint amount = msg.value.div(1 ether);
      
      if(earlySaleBonus)
      {
         amount *= (_price + 2000);
         
         require(amount > _available);
          _available = _available.sub(amount);
          _token.transfer(msg.sender, amount);
          _limits[msg.sender] = _limits[msg.sender].add(amount);
          emit Buy(msg.sender, amount);
       }
       
       else{
           
           amount *= _price;
           
           require ( amount > _available);
           _available = _available.sub(amount);
           _token.transfer(msg.sender, amount);
           _limits[msg.sender] = _limits[msg.sender].add(amount);
           emit Buy(msg.sender, amount);
           
       }
      
  }