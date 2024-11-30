defmodule MusicCentralWeb.RentalsLive.Index do
  use MusicCentralWeb, :live_view

  @sections [
    %{
      id: "rent",
      title: "How the Rent-To-Own Plan Works",
      content: """
      <div class="max-w-4xl w-full p-6 bg-white rounded-lg shadow-lg">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">How the Rent-To-Own Plan Works</h2>

        <p class="text-lg text-gray-700 mb-4">
          We offer a wide variety of instrument rentals, including guitars, keyboards, and more. Perfect for beginners and pros alike.
        </p>

        <div class="space-y-4">
          <div class="bg-gray-100 p-4 rounded-md shadow-md">
            <h3 class="font-semibold text-xl text-gray-800 mb-2">1. Rent for as long as you like</h3>
            <p class="text-gray-700">
              You rent your child's instrument by paying a one-month rental fee in advance. Rent for as long as you like to determine what kind of progress your child will make in band class. You are only obligated for one month at a time.
            </p>
          </div>

          <div class="bg-gray-100 p-4 rounded-md shadow-md">
            <h3 class="font-semibold text-xl text-gray-800 mb-2">
              2. Return the instrument if not continuing
            </h3>
            <p class="text-gray-700">
              If your child will not be continuing with the band program, please call us to make arrangements to have the instrument picked up. Please note: It is the responsibility of the Customer to notify us of the intention to return the instrument. If your child is continuing in band, any subsequent payments will be automatically withdrawn from your specified account (debit/credit card or checking account).
            </p>
          </div>

          <div class="bg-gray-100 p-4 rounded-md shadow-md">
            <h3 class="font-semibold text-xl text-gray-800 mb-2">3. All payments apply to purchase</h3>
            <p class="text-gray-700">
              All payments apply in full to the instrument purchase. After you have made the number of payments specified in your rental agreement, you will own the instrument (provided that all payments are made in a timely manner).
            </p>
          </div>

          <div class="bg-gray-100 p-4 rounded-md shadow-md">
            <h3 class="font-semibold text-xl text-gray-800 mb-2">4. Maintenance coverage</h3>
            <p class="text-gray-700">
              Maintenance coverage is offered for a monthly fee of $5.00. This plan covers repairs necessary to keep the instrument in good playing condition, not including replacement of expendable accessories or cosmetic damage. Please refer to the rental contract for additional information.
            </p>
          </div>

          <div class="bg-gray-100 p-4 rounded-md shadow-md">
            <h3 class="font-semibold text-xl text-gray-800 mb-2">5. Fire and theft coverage</h3>
            <p class="text-gray-700">
              Fire and theft coverage is not provided under this plan. We suggest you contact your insurance agent to determine what coverage may be provided under your homeowner's or renter's insurance policy. If the instrument is lost, stolen, or damaged beyond repair, you will be liable for the full amount of loss.
            </p>
          </div>

          <div class="bg-gray-100 p-4 rounded-md shadow-md">
            <h3 class="font-semibold text-xl text-gray-800 mb-2">6. Return of rental instrument</h3>
            <p class="text-gray-700">
              Your obligation to Music Central, Inc. ceases upon return of the rental instrument, provided that all rental payments are current. Please refer to point 2 for more details.
            </p>
          </div>

          <div class="bg-gray-100 p-4 rounded-md shadow-md">
            <h3 class="font-semibold text-xl text-gray-800 mb-2">7. Early purchase discount</h3>
            <p class="text-gray-700">
              If you would like to purchase the instrument for cash within the first two months of rental, you will receive a 30% discount off the unpaid balance on your account. (Discount available for beginner or student model instruments only.)
            </p>
          </div>

          <div class="bg-gray-100 p-4 rounded-md shadow-md">
            <h3 class="font-semibold text-xl text-gray-800 mb-2">8. Discount after 2 months</h3>
            <p class="text-gray-700">
              At any time after the first two months, Music Central, Inc. will allow a 10% discount of the balance amount (provided all rental payments are current at the time of payoff).
            </p>
          </div>

          <div class="bg-gray-100 p-4 rounded-md shadow-md">
            <h3 class="font-semibold text-xl text-gray-800 mb-2">
              9. Returning an instrument for any reason
            </h3>
            <p class="text-gray-700">
              If you need to return the instrument for any reason (repairs, etc.), please write your child's name and school on a piece of paper and put it in the instrument case.
            </p>
          </div>
        </div>
      </div>
      """
    },
    %{
      id: "new_rental",
      title: "New vs. Rental Return Instruments",
      content: """
              <div class="max-w-4xl w-full p-6 bg-white rounded-lg shadow-lg">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">Instrument Classifications</h2>

        <p class="text-lg text-gray-700 mb-4">
          Music Central generally has two classifications of instruments. Each classification offers different advantages depending on your needs and preferences.
        </p>

        <!-- New Instruments Section -->
        <div class="bg-gray-100 p-4 rounded-md shadow-md mb-4">
          <h3 class="font-semibold text-xl text-gray-800 mb-2">New Instruments</h3>
          <p class="text-gray-700">
            New instruments are brand new, direct from the manufacturer. These instruments have never been played nor rented. If you're looking for an instrument in pristine condition with no prior usage, new instruments are the ideal choice.
          </p>
        </div>

        <!-- Rental Returns Section -->
        <div class="bg-gray-100 p-4 rounded-md shadow-md">
          <h3 class="font-semibold text-xl text-gray-800 mb-2">Rental Returns</h3>
          <p class="text-gray-700 mb-2">
            The second classification is called "Rental Return". These instruments have been rented previously, but are still in 100% guaranteed playing condition. Once returned, they are inspected, cleaned, and sanitized by our repair technicians. If any repairs are needed from the previous rental, these are already taken care of before they are rented again to you.
          </p>
          <p class="text-gray-700 mb-2">
            In most cases, rental returns come from students who tried band, decided they did not like band, and return the instrument without even hardly playing it. The instrument may have a couple of scratches, and the case may be dinged up, but the instrument will be in 100% playing condition.
          </p>
          <p class="text-gray-700">
            As you might expect, Rental Returns are a little less expensive on the monthly payments as well as in the overall total price.
          </p>
        </div>
      </div>
      """
    },
    %{
      id: "brand",
      title: "What brand am I renting?",
      content: """
      <div class="max-w-4xl w-full p-6 bg-white rounded-lg shadow-lg">
      <h2 class="text-2xl font-bold text-gray-800 mb-6">Authorized Dealer for Top Brands</h2>

      <p class="text-lg text-gray-700 mb-4">
      Music Central is an authorized dealer for several of the industry's top brands. Yamaha, Bach, Buffet, Conn, Selmer, Jupiter, Fox, and Armstrong are just a few of the well-respected brands we carry. We work closely with the band directors at the schools we visit to ensure your student gets the preferred brand the band director recommends.
      </p>

      <div class="bg-gray-100 p-4 rounded-md shadow-md mb-4">
      <h3 class="font-semibold text-xl text-gray-800 mb-2">Trusted, Reputable Brands</h3>
      <p class="text-gray-700 mb-2">
      Rest assured your student will receive a reputably branded instrument that will be approved by your band director. Reputable brands are imperative for school-music rentals, as they are the ones that are guaranteed to have parts available should your student's instrument need repair.
      </p>
      <p class="text-gray-700">
      Off-branded instruments are next to impossible to obtain parts for, so we only provide instruments we're guaranteed to be able to service for years to come.
      </p>
      </div>
      </div>

      """
    },
    %{
      id: "faq",
      title: "Rental FAQ's",
      content: """
      <div class="faq-section max-w-3xl mx-auto p-6 bg-white rounded-lg shadow-lg mt-8">
      <h2 class="text-3xl font-semibold text-gray-800 mb-6 text-center">Frequently Asked Questions</h2>

      <!-- FAQ Item 1 -->
      <div class="faq-item mb-6">
      <div class="question text-lg font-semibold text-gray-900">
      <p>Should I rent-to-own or buy?</p>
      </div>
      <div class="answer mt-2 text-gray-700">
      <p>Rent-to-own is an affordable way to try an instrument without investing a large sum of money. You are under no obligation to purchase, and may return the instrument to Music Central at any time. 100% of your rental payments apply to the purchase.</p>
      </div>
      </div>

      <!-- FAQ Item 2 -->
      <div class="faq-item mb-6">
      <div class="question text-lg font-semibold text-gray-900">
      <p>When will I receive my child’s instrument?</p>
      </div>
      <div class="answer mt-2 text-gray-700">
      <p>You may pick up your instrument from our store within 24 hours of order (during regular business hours).</p>
      <p>If you wish for us to deliver it to your child’s school, it could take up to 7 days, depending on when our representative will be visiting that school.</p>
      </div>
      </div>

      <!-- FAQ Item 3 -->
      <div class="faq-item mb-6">
      <div class="question text-lg font-semibold text-gray-900">
      <p>Does my rental payment go towards the instrument?</p>
      </div>
      <div class="answer mt-2 text-gray-700">
      <p>Yes. 100% of your payments (minus sales tax and CMP fees) apply towards the purchase.</p>
      </div>
      </div>

      <!-- FAQ Item 4 -->
      <div class="faq-item mb-6">
      <div class="question text-lg font-semibold text-gray-900">
      <p>Is my instrument new or used?</p>
      </div>
      <div class="answer mt-2 text-gray-700">
      <p>You have the option to rent-to-own either a brand new instrument, or a slightly used instrument (when available). Our used instruments are in “like new” condition, and have been thoroughly tested, cleaned, and sterilized. Used instruments offer a great value, with a lower monthly payment than that of the brand new instrument.</p>
      </div>
      </div>

      <!-- FAQ Item 5 -->
      <div class="faq-item mb-6">
      <div class="question text-lg font-semibold text-gray-900">
      <p>Does my child need a book for band class?</p>
      </div>
      <div class="answer mt-2 text-gray-700">
      <p>Yes. You will be prompted to purchase the book during the rental process.</p>
      </div>
      </div>

      <!-- FAQ Item 6 -->
      <div class="faq-item mb-6">
      <div class="question text-lg font-semibold text-gray-900">
      <p>Can I exchange my child’s instrument?</p>
      </div>
      <div class="answer mt-2 text-gray-700">
      <p>Yes. If your child is not having the success on their instrument that their director thinks they should have, Music Central offers a one-time switch to a different instrument. The payments you have made on the original instrument will automatically apply to the newer instrument. We ask that you consult with your child’s band director before making a switch.</p>
      </div>
      </div>

      <!-- FAQ Item 7 -->
      <div class="faq-item mb-6">
      <div class="question text-lg font-semibold text-gray-900">
      <p>How do I return my instrument, and cancel my contract?</p>
      </div>
      <div class="answer mt-2 text-gray-700">
      <p>If your child does not wish to continue with band, you must contact Music Central, and let us know you wish to return your instrument. We will provide you with the necessary steps to make sure we receive the instrument back, and cancel any remaining payments.</p>
      <p>You may also return the instrument to our store at any time.</p>
      </div>
      </div>

      <!-- FAQ Item 8 -->
      <div class="faq-item mb-6">
      <div class="question text-lg font-semibold text-gray-900">
      <p>What if my instrument needs repair?</p>
      </div>
      <div class="answer mt-2 text-gray-700">
      <p>Simply let your child’s director know that the instrument needs repair and we will pick up the instrument at school on our next visit. We will bring the instrument back to our shop, repair it, and return the instrument as quickly as possible.</p>
      </div>
      </div>

      <!-- FAQ Item 9 -->
      <div class="faq-item mb-6">
      <div class="question text-lg font-semibold text-gray-900">
      <p>What if I wish to purchase a step-up instrument?</p>
      </div>
      <div class="answer mt-2 text-gray-700">
      <p>Music Central will apply 100% of your principal equity towards the purchase of an intermediate or professional model instrument.</p>
      </div>
      </div>
      </div>

      """
    },
    %{
      id: "terms",
      title: "Terms and conditions",
      content: """
      <div class="terms-section max-w-3xl mx-auto p-6 bg-white rounded-lg shadow-lg mt-8">
      <h2 class="text-3xl font-semibold text-gray-800 mb-6 text-center">Music Central, Inc.</h2>
      <h3 class="text-2xl font-semibold text-gray-800 mb-4">Terms of the Rent-To-Own Agreement</h3>

      <div class="terms-list space-y-4">
      <!-- Term 1 -->
      <div class="term">
      <p class="font-semibold text-gray-900">1. Contract termination:</p>
      <p class="text-gray-700">Contract may be terminated by customer at any time by returning the instrument to Music Central. Rental payments will be charged up to the date of return. Customer agrees that if rental account becomes 30-days past due, any due rental fees and late charges incurred will be charged to customer using any payment information received verbally or in writing from the customer or their financial institution. Customer agrees that if rental account becomes 90-days past due, Music Central has the right to take possession of the instrument wherever found at the school or elsewhere and proceed with any applicable legal actions to collect past-due rental and late fees. There is never any obligation to purchase the instrument. A $35.00 fee will be charged for any returned check or payment processed through auto-pay to a bank account (ACH).</p>
      </div>

      <!-- Term 2 -->
      <div class="term">
      <p class="font-semibold text-gray-900">2. Early payoff option:</p>
      <p class="text-gray-700">Rental customer has the option to pay off the instrument before the final rental payment is made, and receive a 10% discount off the total remaining amount.</p>
      </div>

      <!-- Term 3 -->
      <div class="term">
      <p class="font-semibold text-gray-900">3. Purchase option:</p>
      <p class="text-gray-700">Should the rental customer choose to purchase the instrument outright, we offer a cash price of a 30% discount off the normal total contract price. This cash price is also available to any rent-to-own customer within the first 60 days of their rental. After the first 60 days, rental customers should see #2 above.</p>
      </div>

      <!-- Term 4 -->
      <div class="term">
      <p class="font-semibold text-gray-900">4. Comprehensive Maintenance Plan (CMP):</p>
      <ul class="text-gray-700 list-inside list-disc ml-4">
        <li>a.) All adjustments and repairs will be made to keep the instrument in proper playing condition, not including replacement of expendable accessories, such as reeds, oils, drums sticks, etc. Scratches, dents, and other cosmetic damage are not included in this coverage.</li>
        <li>b.) Instrument is only protected under this Comprehensive Maintenance Plan when all fees are paid to date and only for the duration of this agreement.</li>
        <li>c.) Damage due to abuse or neglect of the instrument are not covered under the terms of this agreement. In such case, Customer will be held liable for any repairs to the instrument.</li>
        <li>d.) Loss of the instrument due to fire, theft, neglect, or other catastrophe is not covered under the terms of this plan. In case of such loss, Customer will be held liable for the outstanding balance amount on the instrument at time of the loss.</li>
      </ul>
      </div>

      <!-- Term 5 -->
      <div class="term">
      <p class="font-semibold text-gray-900">5. Term of Contract:</p>
      <p class="text-gray-700">The maximum term of this agreement is 36 months, although some instruments have shorter terms. If all payments are made according to the Rental Fee schedule, the customer will own the instrument at the end of the term of this agreement.</p>
      </div>

      <!-- Term 6 -->
      <div class="term">
      <p class="font-semibold text-gray-900">6. Instrument location:</p>
      <p class="text-gray-700">The instrument may be kept only at rental customer's stated address or school.</p>
      </div>

      <!-- Term 7 -->
      <div class="term">
      <p class="font-semibold text-gray-900">7. Return of the instrument:</p>
      <p class="text-gray-700">Upon termination of the contract, the customer is responsible to return the instrument to Music Central. It is the CUSTOMER's responsibility to return the instrument directly to Music Central in person during normal business hours, or to call Music Central (270-885-0074 OR 800-733-7529) during normal business hours to arrange another method of return. ALL OUTSTANDING RENTAL FEES, CMP FEES, AND PAST DUE FEES ARE DUE UPON RETURN. The instrument should be returned in a reasonably similar condition to that in which it was originally rented. Customer may be responsible for any repairs needed to the rented instruments outside of what is deemed reasonable wear and tear.</p>
      </div>

      <!-- Term 8 -->
      <div class="term">
      <p class="font-semibold text-gray-900">8. Reinstatement after termination:</p>
      <p class="text-gray-700">If customer fails to make timely payments and Music Central elects to terminate this agreement, Customer may reinstate the agreement, without loss of any rights or options herein, by paying all past due rental charges, any reasonable costs for pickup and instrument cleaning (if applicable), and any applicable late fees within 5 days of the date of termination. Further, any Customer who voluntarily returns an instrument while in good customer standing may reinstate their contract within 30 days of termination if they choose.</p>
      </div>

      <!-- Term 9 -->
      <div class="term">
      <p class="font-semibold text-gray-900">9. Legal enforcement:</p>
      <p class="text-gray-700">THIS RENTAL AGREEMENT IS REGULATED BY STATE LAWS AND MAY BE ENFORCED BY THE ATTORNEY GENERAL OR BY PRIVATE LEGAL ACTION.</p>
      </div>

      <!-- Term 10 -->
      <div class="term">
      <p class="font-semibold text-gray-900">10. Title of instrument:</p>
      <p class="text-gray-700">Title of the instrument shall remain with Music Central, Inc until the Customer makes all payments required as detailed on the rental agreement. It is understood that no other agreement, guarantee, warranty, verbal or written, expressed or implied shall limit or qualify the terms of this agreement.</p>
      </div>

      <!-- Term 11 -->
      <div class="term">
      <p class="font-semibold text-gray-900">11. Payment and fees:</p>
      <p class="text-gray-700">All payments are due in advance and no refund will be allowed on any monies paid. It is further agreed that all costs, including a reasonable sum for attorney's fees, for collection of payment defaults, or any other expense incurred in resolving delinquency of payments shall be held liable to the Customer.</p>
      </div>

      <!-- Term 12 -->
      <div class="term">
      <p class="font-semibold text-gray-900">12. Late fees:</p>
      <p class="text-gray-700">Rental payments received ten (10) days after due date will incur a $5.00 late fee.</p>
      </div>

      <!-- Term 13 -->
      <div class="term">
      <p class="font-semibold text-gray-900">13. Encumbrances:</p>
      <p class="text-gray-700">Rental customer acknowledges that customer's interest in the rental instrument is subordinate to any present or future encumbrances recorded or unrecorded, if any, in favor of Music Central.</p>
      </div>

      <!-- Term 14 -->
      <div class="term">
      <p class="font-semibold text-gray-900">14. Auto charge agreement:</p>
      <p class="text-gray-700">Customer agrees to an auto charge on the credit card supplied for rental payment. Customer agrees that Music Central may pursue all avenues of collection and authorizes Music Central to prepare and submit a charge using any of the payment information provided to recover all charges and all other unpaid amounts due to (a) customer's failure to pay on or before the customer's due date, (b) customers failure to timely return all items rented through this contract, (c) damages to returned items (not to exceed the retail price of the item), and (d) other unpaid charges and reasonable legal fees resulting from failure to return rented items.</p>
      </div>
      </div>
      </div>

      """
    }
  ]

  def mount(_params, _session, socket) do
    socket = assign(socket, :sections, @sections)
    {:ok, assign(socket, active_section: nil)}
  end

  def handle_event("toggle_section", %{"section" => section_id}, socket) do
    active_section = if socket.assigns.active_section == section_id, do: nil, else: section_id
    {:noreply, assign(socket, active_section: active_section)}
  end

  def render(assigns) do
    ~H"""
    <.back navigate={~p"/"} class="hover:text-red-700">Back</.back>

    <section class="p-8 bg-gray-50 min-h-screen flex flex-col gap-8">
      <!-- Video Section -->
      <div class="max-w-4xl w-full bg-white shadow-lg rounded-lg overflow-hidden transition-colors duration-300">
        <iframe
          class="w-full h-96 rounded-lg transition-transform duration-300 ease-in-out border-4 border-transparent hover:border-red-700"
          src="https://www.youtube.com/embed/yBBkiZToUP8"
          title="YouTube video player"
          frameborder="0"
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
          allowfullscreen
        >
        </iframe>
      </div>
      <!-- List of Rental Options -->
      <div class="max-w-4xl w-full p-6">
        <ul class="space-y-4 list-disc">
          <%= for section <- @sections do %>
            <li>
              <!-- Clickable List Item -->
              <button
                phx-click="toggle_section"
                phx-value-section={section.id}
                class={[
                  "w-full text-left text-gray-800 font-bold text-xl hover:text-red-700 focus:outline-none",
                  @active_section == section.id && "text-red-700"
                ]}
              >
                <%= section.title %>
              </button>
              <!-- Expandable Content Section -->
              <div
                :if={@active_section == section.id}
                class="mt-2 p-4 text-gray-700 transition-all duration-500 bg-gray-100 rounded-r-lg border-l-4 border-red-700"
              >
                <div class="prose"><%= raw(section.content) %></div>
              </div>
            </li>
          <% end %>
        </ul>
      </div>
    </section>
    """
  end
end
