%%raw("import './Transaction.css'");

@react.component
let make = (~setTransactions: (array<Trans.transaction> => array<Trans.transaction>) => unit, ~setExpense: (_) => unit, ~setIncome: (_) => unit) => {
    let (text, setText) = React.useState(_ => "");
    let (amount, setAmount) = React.useState(_ => 0.00);

    let onTextChange = e => {
        let currValue = ReactEvent.Form.target(e)["value"];
        setText(_ => currValue);
    }
    let onAmountChange = e => {
        let currValue = ReactEvent.Form.target(e)["value"];
        setAmount(_ => currValue);
    }
    let addTransaction = (_) => {
        if (text !== "" && amount !== 0.00) {
            setTransactions((prev) => Belt.Array.concat(prev, [{name: text, amount}]));
            if (amount < 0.00) {
                setExpense((prev) => prev -. abs_float(amount));
            } else {
                setIncome((prev) => prev +. abs_float(amount))
            }
            setAmount(_ => 0.00);
            setText(_ => "");

        }
    }

    let keyPress = (event: ReactEvent.Keyboard.t) => {
        if (ReactEvent.Keyboard.key(event) === "Enter") {
            if (text !== "" && amount !== 0.00) {
                addTransaction();
            }
        }
    }

    <div className="transaction">
        <Section title="Add new transaction" />
        <label>{React.string("Text")}</label>
        <input type_="text" placeholder="Enter Text..." value={text} onChange={onTextChange} onKeyDown={keyPress}/>
        <label className="amount">{React.string("Amount")}</label>
        <div>{React.string("(negative-expense, positive-income)")}</div>
        <input type_="number" step={0.01} placeholder="Enter Amount..." value={Belt.Float.toString(amount)} onChange={onAmountChange}
        onKeyDown={keyPress} />
        <button className="add-transaction" onClick={addTransaction}>{React.string("Add Transaction")}</button>
    </div>
}