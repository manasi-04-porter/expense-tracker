%%raw("import './index.css'")

@react.component
let make = () => {
    let (income, setIncome) = React.useState(_ => 0.00);
    let (expense, setExpense) = React.useState(_ => 0.00);
    let (transactions, setTransactions): (array<Trans.transaction>, (_) => unit) = React.useState(_ => []);

    <div>
        <Heading title="Expense Tracker" />
        <Balance amount={income -. abs_float(expense)} text="Your Balance" />
        <IncomeExpense income expense />
        <History transactions />
        <Transaction setExpense setIncome setTransactions />
    </div>
}