@react.component
let make = (~title: string) => {
    <Mui.Typography variant=#h6 paragraph=true>
        {React.string(title)}
    </Mui.Typography>
}