%%raw("import './Balance.css'");

@react.component
let make = (~amount: float, ~text: string) => {
    let renderText = "$" ++  Belt.Float.toString(amount);
    <div className="balance">
        <div className="balance-text">{React.string(text)}</div>
        <div className="balance-amount">{React.string(renderText)}</div>
    </div>
}