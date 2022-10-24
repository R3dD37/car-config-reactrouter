import '../styles/CarTile.css';

export default function CarTile(props) {
    return (
        <a href="">
            <div className='car-tile'>
                <header>
                    <span>{props.name}</span>
                </header>
                <section>
                    <img src="https://cutt.ly/ZVBb0fu" alt="ImageModel" className='car-tile-image'/>
                </section>
                <footer>
                    Buttons <br />
                    fdsfsd
                </footer>
            </div>
        </a>
    );
}