%%raw("import './Section.css'");

@react.component
let make = (~title: string) => {
    <section className="section-container">
    <div>{React.string(title)}</div>
    <Mui.Divider />
    </section>
}