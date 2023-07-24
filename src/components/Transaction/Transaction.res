%%raw("import './Transaction.css'");

@react.component
let make = (~text: string, ~amount: float, ~setText: (_) => unit, ~setAmount: (_) => unit) => {
    let onTextChange = e => {
        let currValue = ReactEvent.Form.target(e)["value"];
        setText(_ => currValue);
    }
    let onAmountChange = e => {
        let currValue = ReactEvent.Form.target(e)["value"];
        setAmount(_ => currValue);
    }

    <div className="transaction">
        <label>{React.string("Text")}</label>
        <input type_="text" placeholder="Enter Text..." value={text} onChange={onTextChange} />
        <label className="amount">{React.string("Amount")}</label>
        <div>{React.string("(negative-expense, positive-income)")}</div>
        <input type_="number" step={0.01} placeholder="Enter Amount..." value={Belt.Float.toString(amount)} onChange={onAmountChange} />
    </div>
}