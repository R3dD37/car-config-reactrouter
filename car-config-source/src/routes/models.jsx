import CarTile from "../modules/CarTile";
import '../styles/models.css';

export default function Models() {
    return(
        <main>
            <h2>Models</h2>
            <section className="car-list">
                <CarTile name="Golf"/>
                <CarTile name="NieGolf"/>
            </section>
        </main>
    );
}