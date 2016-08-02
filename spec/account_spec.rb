require 'account'

describe Account do
  let(:account) { Account.new("0123456789") }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Account" do
        # o = Object.new
        expect(account).to be_an_instance_of Account
      end
    end

    context "with invalid input" do
      it "throws an InvalidAccountNumberError when acct_number has less than 10 digits" do
        expect { Account.new("123") }.to raise_error(InvalidAccountNumberError)
      end
    end
  end

  context "when using default starting_balance" do
    describe "#transactions" do
      it "returns the default starting_balance" do
        expect(account.transactions.first).to eq(0)
      end
    end

    describe "#balance" do
      it "is 0" do    
        expect(account.balance).to eq(0)
      end
    end
  end

  context "when initialized with a starting_balance" do
    let(:account) { Account.new("1234567890", 100) }

    describe "#transactions" do
      it "returns the specified balance" do
        expect(account.transactions[0]).to eq(100)
      end
    end

    describe "#balance" do
      it "is the specified balance" do
        expect(account.balance).to eq(100)
      end
    end

    describe "#withdraw!" do
      it "decreases the balance" do
        expect(account.withdraw!(50)).to eq(50)
      end

      it "substracts positive amounts" do
        expect(account.withdraw!(100)).to eq(0)
      end
    end
  end #aqui se termina de utilizar el numero de cuenta de 1234567890

  describe "#account_number" do
    it "masks the number of the account" do
      expect(account.acct_number).to eq("******6789")
    end
  
  end

  describe "deposit!" do
    it "requires a positive amount" do
      expect(account.deposit!(100)).to eq(100)
    end

    it "increases the balance of the account" do
      expect(account.deposit!(100)).to eq(100)
      expect(account.deposit!(100)).to eq(200)
      expect(account.balance).to eq(200)
    end
  end

  describe "#withdraw!" do
    it "throws an OverdraftError when withdraw amount is bigger than balance" do
      expect{account.withdraw!(1000)}.to raise_error(OverdraftError)
    end
  end
end
