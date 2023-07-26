%%raw("import './History.css'");

@react.component
let make = (~transactions: array<Trans.transaction>) => {
    let historyEntry = (entry: Trans.transaction) => {
        let strAmount = Belt.Float.toString(abs_float(entry.amount));
            if (entry.amount < 0.00) {
                "-$" ++ strAmount;
            } else {
                "+$" ++ strAmount;
            }
    }

    let historyEntries = Belt.Array.map(transactions, (val) => {
            <div className=`payment-history ${val.amount < 0.00 ? "status-red": ""}` key={val.name}>
                <div>{React.string(val.name)}</div>
                <div>{React.string(historyEntry(val))}</div>
            </div>
            });
    <>
        <Section title="History" />
        <div className="history-entries">
            {React.array(historyEntries)}
        </div>
    </>
}