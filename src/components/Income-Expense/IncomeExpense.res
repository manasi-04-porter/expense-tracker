%%raw("import './IncomeExpense.css'");

@react.component
let make = (~income: float, ~expense: float) => {
    <div className="income-expense-container">
        <div className="income-container">
            <div className="container-text">{React.string("Income")}</div>
            <div className="income-amount">{React.string(Belt.Float.toString(income))}</div>
        </div>
        <div className="vl"></div>
        <div className="expense-container">
            <div className="container-text">{React.string("Expense")}</div>
            <div className="expense-amount">{React.string(Belt.Float.toString(expense))}</div>
        </div>
    </div>
}