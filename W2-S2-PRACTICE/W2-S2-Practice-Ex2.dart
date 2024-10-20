
enum AccountType {SavingAccount("Saving Account"), CurrentAccount("Checking Account"), SalaryAccount("Salary Account");
  final String type;
  const AccountType(this.type);
  String toString() => type;
}
class BankAccount {
    String _accountHolderName;
    AccountType _accountType;
    int _accountNumber;
    double _accBalance;

    // Balance will be store as dollar
    BankAccount(this._accountHolderName, this._accountType, this._accountNumber, this._accBalance);

    double get accBalance => this._accBalance;
    String get accountHolderName => this._accountHolderName;
    AccountType get accountType => this._accountType;
    int get accountNumber => this._accountNumber;
    
    // Return current balance
    double balance() {
      return _accBalance;
    }
    void withdraw(double amount) {
      try {
        if (amount <= 0) {
          throw (' Withdrawal amount must be positive.');
        }
        else if (amount > _accBalance){
          throw (' Insufficient balance for withdrawal!');
        }
        else {
          _accBalance -= amount;
        }
      }catch (e) {
        print(e);
      }
    }
    void credit(double amount) {
      _accBalance += amount;
    }

    void printInfo(){
      print(" BankAccount: $_accountHolderName\n AccountType: $_accountType\n AccountNumber: $_accountNumber\n Balance: \$${_accBalance}");
    }
  }

class Bank {
    String bankName;
    String contactInfo;
    List<BankAccount> accounts;
    
    Bank(this.bankName, this.contactInfo) : accounts = []; // initialize the accounts list

    void createAccount(int accountNumber, String accountHolderName, AccountType accountType, double initialBalance) {
    // Check for uniqueness of account number
    for (var account in accounts) {
      if (account.accountNumber == accountNumber) {
        throw (' Account with ID $accountNumber already exists!'); // Throw exception for duplicate account number
      }
    }

    // Create a new BankAccount instance and add it to the accounts list
    var newAccount = BankAccount(accountHolderName, accountType, accountNumber, initialBalance);
    accounts.add(newAccount);
    print(' Account created successfully for $accountHolderName with account number $accountNumber.');
  }

  // Method to display all accounts
  void displayAccounts() {
    for (var account in accounts) {
      account.printInfo();
      print(' Current Balance: \$${account.balance()}\n');
    }
  }

}
void main() {
  BankAccount bank = BankAccount("CADT", AccountType.CurrentAccount, 1234567, 56.7);
  bank.printInfo();
  print(' Current Balance: \$${bank.balance()}');
  bank.withdraw(59);
  bank.credit(45);
  print(' Current Balance: \$${bank.balance()}');

  Bank myBank = Bank("ACLEDA", "skefef@gmail.com");
  try{ 
    myBank.createAccount(1457896, "Sreysor", AccountType.CurrentAccount, 100);
    myBank.createAccount(1457896, "Sreysor", AccountType.CurrentAccount, 100);
  }catch (e) {
    print(e);
  }
  //display all accounts  
  myBank.displayAccounts();

}