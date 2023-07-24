%%raw("import './index.css'")


type entryType = {name: string, amount: float};
@react.component
let make = () => {
    let (income, setIncome) = React.useState(_ => 0.00);
    let (expense, setExpense) = React.useState(_ => 0.00);
    let (entries, setEntries): (array<entryType>, (_) => unit) = React.useState(_ => []);
    let (text, setText) = React.useState(_ => "");
    let (amount, setAmount) = React.useState(_ => 0.00);

    let addTransaction = (e) => {
        setEntries((prev) => Belt.Array.concat(prev, [{name: text, amount}]));
        if (amount < 0.00) {
            setExpense((prev) => prev -. abs_float(amount));
        } else {
            setIncome((prev) => prev +. abs_float(amount))
        }
        setAmount(_ => 0.00);
        setText(_ => "");
    }

    let historyEntries = Belt.Array.map(entries, (val) => {
                let strAmount = Belt.Float.toString(abs_float(val.amount));
                let amountString = if (val.amount < 0.00) {
                    "-$" ++ strAmount;
                } else {
                    "+$" ++ strAmount;
                }
                <div className=`payment-history ${val.amount < 0.00 ? "status-red": ""}` key={val.name}>
                    <div>{React.string(val.name)}</div>
                    <div>{React.string(amountString)}</div>
                </div>
                });
    <div style={height: "100vh"}>
        <Heading title="Expense Tracker" />
        <Balance amount={income -. abs_float(expense)} text="Your Balance" />
        <IncomeExpense income expense />
        <Section title="History" />
        <div className="history-entries">
            {React.array(historyEntries)}
        </div>
        <Section title="Add new transaction" />
        <Transaction text amount setText setAmount/>
        <button className="add-transaction" onClick={addTransaction}>{React.string("Add Transaction")}</button>
    </div>
}