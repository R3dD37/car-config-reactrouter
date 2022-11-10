import "./styles/primary-button-style.css"

/**
 * 
 * @param {{text: string, action: delegate}} props 
 * @returns 
 */

export default function PrimaryButton(props) {
    return (
        <button className="primary-button" onClick={props.action}>
            {props.text}
        </button>
    );
}