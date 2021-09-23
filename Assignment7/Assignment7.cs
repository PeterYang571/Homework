
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BankingApp
{
    class SavingsAccount : BankAccount
    {
        // Global Varibles
        private decimal interestRate;
        private decimal minBalance;
        private decimal savingsBalance;

        public SavingsAccount()
            : base()
        {
        }

        public SavingsAccount(string customerLastname, string CustomerFirstName, string id, decimal
            intRate, decimal minimumBal, decimal thebalance)
            : base(customerLastname, CustomerFirstName, id)
        {
            interestRate = intRate;
            minBalance = minimumBal;
            savingsBalance = thebalance;
        }

        internal void withdraw(int v)
        {
            throw new NotImplementedException();
        }

        internal void deposit(int v)
        {
            throw new NotImplementedException();
        }

        // Property interestRate
        public Decimal InterestRate
        {
            get
            {
                return interestRate;
            }
            set
            {
                interestRate = value;
            }
        }

        // Property minBalance
        public decimal MinBalance
        {
            get
            {
                return minBalance;
            }
            set
            {
                interestRate = value;
            }
        }

        // Property balance
        public decimal Balance
        {
            get
            {
                return savingsBalance;
            }
            set
            {
                savingsBalance = value;
            }
        }

        public override string ToString()
        {
            return base.ToString() + "\nSavings Balance " + savingsBalance.ToString("C") +
                "\nInterest Rate: " + interestRate.ToString("P2");
        }


    }
}

/*CheckingAcount.cs
* This class extends BankAccount
* by including details for checking account
* customers
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BankingApp
{
    class CheckingAccount : BankAccount
    {
        private bool freeChecking;
        private bool freeChecksProvided;
        private bool cancelledChecksReturned;
        private decimal checkingBalance;
        private decimal serviceCharge;


        public CheckingAccount()
            : base()
        {
        }

        public CheckingAccount(string lname, string fname, string id, bool freeCk, bool chkProv,
            bool cancelCks, decimal bal, decimal serviceCh)
            : base(lname, fname, id)
        {
            freeChecking = false;
            freeChecksProvided = false;
            checkingBalance = bal;
            serviceCharge = serviceCh;
        }

        // Property freeChecking

        public bool FreeChecking
        {
            get
            {
                return freeChecking;
            }
            set
            {
                freeChecking = value;
            }

        }
        public bool FreeChecksProvided
        {
            get
            {
                return freeChecksProvided;
            }
            set
            {
                freeChecksProvided = value;
            }

        }

        public decimal ServiceCharge
        {
            get
            {
                return serviceCharge;
            }
            set
            {
                serviceCharge = value;
            }
        }

        public decimal CheckingBalance
        {
            get
            {
                return checkingBalance;
            }
            set
            {
                checkingBalance = value;
            }
        }

        public bool CancelledChecksReturned
        {
            get
            {
                return CancelledChecksReturned;
            }
            set
            {
                cancelledChecksReturned = value;
            }
        }

        public override string ToString()
        {
            return base.ToString() + "\nChecking Balance: " + checkingBalance.ToString("c") +
                "\nMonthly Service Charge: " + serviceCharge.ToString("C");
        }
    }
}

/* This class extends BankAccount
* providing details regarding
* savings account objects.
*/


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BankingApp
{
    class SavingsAccount : BankAccount
    {
        // Global Varibles
        private decimal interestRate;
        private decimal minBalance;
        private decimal savingsBalance;

        public SavingsAccount()
            : base()
        {
        }

        public SavingsAccount(string customerLastname, string CustomerFirstName, string id, decimal
            intRate, decimal minimumBal, decimal thebalance)
            : base(customerLastname, CustomerFirstName, id)
        {
            interestRate = intRate;
            minBalance = minimumBal;
            savingsBalance = thebalance;
        }

        internal void withdraw(int v)
        {
            throw new NotImplementedException();
        }

        internal void deposit(int v)
        {
            throw new NotImplementedException();
        }

        // Property interestRate
        public Decimal InterestRate
        {
            get
            {
                return interestRate;
            }
            set
            {
                interestRate = value;
            }
        }

        // Property minBalance
        public decimal MinBalance
        {
            get
            {
                return minBalance;
            }
            set
            {
                interestRate = value;
            }
        }

        // Property balance
        public decimal Balance
        {
            get
            {
                return savingsBalance;
            }
            set
            {
                savingsBalance = value;
            }
        }

        public override string ToString()
        {
            return base.ToString() + "\nSavings Balance " + savingsBalance.ToString("C") +
                "\nInterest Rate: " + interestRate.ToString("P2");
        }


    }
}